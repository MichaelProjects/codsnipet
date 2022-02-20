use rocket::response::content::Json;
use rocket::http::Status;
use rocket::State;
use serde_json::json;

use crate::models::CodeIn;
use crate::response::ApiResponse;


#[post("/code", data = "<payload>")]
pub(crate) async fn create_entry(
    payload: Json<CodeIn>,
) -> ApiResponse{
    
}

#[get("/code/<code_id>")]
pub async fn update_entry(code_id: String){}

#[delete("/code/<code_id>")]
pub async fn delete_entry(code_id: String){}

#[get("/code/<code_id>")]
pub async fn get_entry(code_id: String){}

#[get("/code")]
pub async fn get_all_entries(){}