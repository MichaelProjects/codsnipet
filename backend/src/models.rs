use serde::{Serialize, Deserialize};


#[derive(Deserialize, Debug)]
pub struct CodeIn{
    pub code: String,
    pub title: String,
    pub language: String,
    pub tags: Vec<String>,
}