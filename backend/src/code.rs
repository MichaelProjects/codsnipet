use mongodb::{bson::oid::ObjectId};
use serde::{Serialize, Deserialize};
use chrono::{Utc};
use crate::models::CodeIn;


#[derive(Serialize, Deserialize, Clone, Debug)]
pub struct Code{
    #[serde(rename = "_id", skip_serializing_if = "Option::is_none")]
    pub id: Option<ObjectId>,
    pub code: String,
    pub title: String,
    pub language: String,
    pub tags: Vec<String>,
    #[serde(with = "bson::serde_helpers::chrono_datetime_as_bson_datetime")]
    pub create_at: chrono::DateTime<Utc>
}
impl Code{
    pub fn new(code: String, title: String, language: String, tags: Vec<String>) -> Code{
        Code{
            id: None,
            code,
            title,
            language,
            tags,
            create_at: Utc::now()
        }
        }
    pub fn from_code_in(code_in: CodeIn) -> Code{
        Code{
            id: None,
            code: code_in.code,
            title: code_in.title,
            language: code_in.language,
            tags: code_in.tags,
            create_at: Utc::now()
        }
    }

    }

