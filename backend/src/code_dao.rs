use crate::models::CodeIn;
use crate::{code::Code, dao_error::DaoError};
use bson;
use mongodb;
use mongodb::{
    bson::doc,
    options::{ClientOptions, FindOptions, DeleteOptions, UpdateOptions},
    Client,
};
use rocket::futures::TryStreamExt;
use std::error::Error;

async fn get_client(db_url: &String) -> Result<Client, Box<dyn Error>> {
    let client_options = ClientOptions::parse(db_url).await?;
    let client = Client::with_options(client_options)?;
    Ok(client)
}

pub async fn insert_code_snipet(db_url: &String, data: Code) -> Result<bool, Box<dyn Error>> {
    let database = get_client(db_url).await?.database("codsnipet");
    let typed_collection = database.collection::<Code>("snippets");
    typed_collection.insert_one(data, None).await?;
    Ok(true)
}

pub async fn get_code_snipet(db_url: &String, id: String) -> Result<Option<Code>, Box<dyn Error>> {
    let database = get_client(db_url).await?.database("codsnipet");
    let typed_collection = database.collection::<Code>("snippets");
    
    let parsed_id = id.as_str();
    let object_id = bson::oid::ObjectId::parse_str(parsed_id)?;

    let filter = doc! { "_id": object_id  };
    let cursor = typed_collection.find_one(filter, None).await?;
    Ok(cursor)
}

pub async fn update_code_snipet(db_url: &String, id: String, payload: CodeIn) -> Result<bool, Box<dyn Error>> {
    let database = get_client(db_url).await?.database("codsnipet");
    let typed_collection = database.collection::<Code>("snippets");
    
    let parsed_id = id.as_str();
    let object_id = bson::oid::ObjectId::parse_str(parsed_id)?;
    let filter = doc! { "_id": object_id  };
    let update = doc! {"$set": {
            "code": payload.code,
            "title": payload.title,
            "language": payload.language,
            "tags": payload.tags,
    }};

    let update_option = UpdateOptions::builder().build();

    let update_result = typed_collection.update_one(filter, update, update_option).await?;
    if update_result.matched_count.eq(&1) {
        Ok(true)
    } else {
        Err(Box::new(DaoError::Failed))
    }
}

pub async fn delete_code_snipet(db_url: &String, id: String) -> Result<bool, Box<dyn Error>> {
    let database = get_client(db_url).await?.database("codsnipet");
    let typed_collection = database.collection::<Code>("snippets");
    
    let parsed_id = id.as_str();
    let object_id = bson::oid::ObjectId::parse_str(parsed_id)?;
    
    let filter = doc! { "_id": object_id  };
    let delete_option = DeleteOptions::builder().build();
    let delete_result = typed_collection.delete_one(filter, delete_option).await?;
    if delete_result.deleted_count.eq(&1) {
        Ok(true)
    } else {
        Err(Box::new(DaoError::Failed))
    }
}

pub async fn get_all_code_snipets(db_url: &String, limit: i32, site: i32) -> Result<Vec<Code>, Box<dyn Error>> {
    let database = get_client(db_url).await?.database("codsnipet");
    let typed_collection = database.collection::<Code>("snippets");
    let skip = limit * site;
    let option_filter = FindOptions::builder().build();
    let mut cursor = typed_collection.find(None, option_filter).await?;
    let mut code_snipets: Vec<Code> = vec![];
    while let Some(data) = cursor.try_next().await? {
        code_snipets.push(data)
    }
    Ok(code_snipets)
}
