use mongodb::{Client, options::ClientOptions};
use uuid::Uuid;

#[derive(Serialize, Deserialize, Clone, Debug)]
pub struct Code{
    pub id: String,
    pub code: String,
    pub title: String,
    pub language: String,
    pub tags: Vec<String>,
    pub create_at: NativeTime
}
impl Code{
    pub fn new(code: String, title: String, language: String, tags: Vec<String>) -> Code{
        Code{
            id: Uuid::new_v4().to_string(),
            code,
            title,
            language,
            tags,
            create_at: NativeTime::now()
}}

fn get_client() -> Client{
    let client_options = ClientOptions::parse("mongodb://localhost:27017").unwrap();
    let client = Client::with_options(client_options).unwrap();
    client
}