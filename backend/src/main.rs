#[macro_use]
extern crate rocket;

mod config;
mod handle;
mod models;
mod response;
mod code;

use rocket::{Build, Rocket};
use rocket::figment::Figment;
use crate::config::ConfigGeneral;


pub fn insert_conf_values(conf: &ConfigGeneral) -> Figment {
    rocket::Config::figment()
        .merge(("port", &conf.general.port))
        .merge(("address", &conf.general.address))
        .merge(("cli_colors", false)
    )
}

pub fn rocket_creator(conf: ConfigGeneral) -> Rocket<Build> {
    rocket::custom(insert_conf_values(&conf))
        .manage(conf)
        .mount(
            "/api/v1",
            routes![],
        )
}

#[rocket::main]
async fn main() {
    let conf = match ConfigGeneral::new() {
        Ok(conf) => conf,
        Err(err) => panic!("Cloud not read Config, ensure it in the right place: {}", err),
    };
    rocket_creator(conf).launch().await;
}