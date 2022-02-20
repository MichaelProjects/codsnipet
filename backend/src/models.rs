use serde::{Serialize, Deserialize};


#[derive(Serialize, Deserialize, Clone, Debug)]
pub struct CodeIn{
    code: String,
    title: String,
    language: String,
    tags: Vec<String>,
}