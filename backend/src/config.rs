use config::{Config, ConfigError, File};
use serde::{Deserialize};
use std::env;


#[derive(Debug, Deserialize)]
pub struct General {
    pub address: String,
    pub port: u16,
    pub debug: bool
}

#[derive(Debug, Deserialize)]
pub struct Database {
    pub connection_string: String,
}

#[derive(Debug, Deserialize)]
pub struct Service {
    pub jwt_secret: String
}

#[derive(Debug, Deserialize)]
pub struct ConfigGeneral {
    pub general: General,
    pub database: Database,
    pub service: Service
}

impl ConfigGeneral {
    pub fn new() -> Result<Self, ConfigError> {
        let mut s = Config::default();
        s.merge(File::with_name("config"))?;

        let env = env::var("RUN_MODE").unwrap_or_else(|_| "development".into());
        s.merge(File::with_name(&format!("conf/{}", env)).required(false))?;

        s.try_into()
    }
}