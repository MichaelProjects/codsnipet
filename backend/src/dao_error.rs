use std::fmt;
use std::error;

type Result<T> = std::result::Result<T, Box<dyn error::Error>>;

#[derive(Debug, Clone)]
pub enum DaoError { NotFound, Failed }

impl fmt::Display for DaoError {
    fn fmt(&self, f: &mut fmt::Formatter) -> fmt::Result {
         match self {
            DaoError::NotFound => write!(f, "Could not find the corresponding object"),
            DaoError::Failed => write!(f, "Data operation failed"),
        }
    }
}
impl error::Error for DaoError {}
