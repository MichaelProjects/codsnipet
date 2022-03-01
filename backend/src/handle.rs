use rocket::State;
use rocket::http::Status;
use serde_json::json;

use rocket::serde::json::Json;
use crate::config::ConfigGeneral;
use crate::models::CodeIn;
use crate::response::ApiResponse;
use crate::code::Code;
use crate::code_dao::{insert_code_snipet, delete_code_snipet, get_code_snipet, get_all_code_snipets, update_code_snipet, search_code_snippets};


#[post("/code", data = "<payload>")]
pub(crate) async fn create_entry(settings: &State<ConfigGeneral>, payload: Json<CodeIn>) -> ApiResponse{
    let result = insert_code_snipet(&settings.database.connection_string, Code::from_code_in(payload.0)).await;
    match result{
        Ok(code) => ApiResponse::new(Status::Created, json!({"message": "created"})),
        Err(err) => ApiResponse::new(Status::BadRequest, json!({"error": err.to_string()}))
    }
}

#[patch("/code/<code_id>", data = "<payload>")]
pub async fn update_entry_endpoint(settings: &State<ConfigGeneral>, code_id: String, payload: Json<CodeIn>) -> ApiResponse{
    let result = update_code_snipet(&settings.database.connection_string, code_id, payload.0).await;
    match result{
        Ok(code) => ApiResponse::new(Status::Ok, json!({"message": "updated!"})),
        Err(err) => ApiResponse::new(Status::NotFound, json!({"error": "failed to update"}))
    }
}

#[delete("/code/<code_id>")]
pub async fn delete_entry_endpoint(settings: &State<ConfigGeneral>, code_id: String) -> ApiResponse{
    let result = delete_code_snipet(&settings.database.connection_string, code_id).await;
    match result{
        Ok(code) => ApiResponse::new(Status::Ok, json!({"message": "deleted"})),
        Err(err) => ApiResponse::new(Status::NotFound, json!({"error": "failed deleting snipet"}))
    }
}

#[get("/code/<code_id>")]
pub async fn get_entry(settings: &State<ConfigGeneral>, code_id: String) -> ApiResponse{
    let result = get_code_snipet(&settings.database.connection_string, code_id).await;
    match result{
        Ok(code) => ApiResponse::new(Status::Ok, json!({"data": code})),
        Err(err) => ApiResponse::new(Status::NotFound, json!({"error": "Failed"}))
    }
}

#[get("/code/search?<q>")]
pub async fn get_search(settings: &State<ConfigGeneral>, q: String) -> ApiResponse{
    println!("{}", q);
    let result = search_code_snippets(&settings.database.connection_string, q).await;
    match result{
        Ok(code) => ApiResponse::new(Status::Ok, json!({"data": code})),
        Err(err) => ApiResponse::new(Status::NotFound, json!({"error": "Failed"}))
    }
}

#[get("/code?<limit>&<site>")]
pub async fn get_all_entries(
    settings: &State<ConfigGeneral>,
    limit: Option<i32>, 
    site: Option<i32>
) -> ApiResponse{
    let result = get_all_code_snipets(&settings.database.connection_string,limit.unwrap(), site.unwrap()).await;
    match result{
        Ok(code) => ApiResponse::new(Status::Ok, json!({"data": code})),
        Err(err) => ApiResponse::new(Status::NotFound, json!({"": ""}))
    }
}