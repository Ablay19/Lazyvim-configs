struct ColorRegularStruct {
    red: u8,
    green: u8,
    blue: u8,
}

struct ColorTupleStruct(u8, u8, u8);

impl ColorRegularStruct {
    pub fn new(red: u8, green: u8, blue: u8) -> Self {
        Self { red, green, blue }
    }
}

#[derive(Debug)]
struct UnitStruct;

fn main() {
    // You can optionally experiment here.
}

#[cfg(test)]
mod tests {
    use super::*;

    use crate::ColorRegularStruct;

    #[test]
    fn regular_structs() {
        // TODO: Instantiate a regular struct.
        let green = ColorRegularStruct {
            red: 0,
            green: 255,
            blue: 0,
        };
        assert_eq!(green.red, 0);
        assert_eq!(green.green, 255);
        assert_eq!(green.blue, 0);
    }

    #[test]
    fn tuple_structs() {
        // TODO: Instantiate a tuple struct.
        let green = ColorTupleStruct(0, 255, 0);
        assert_eq!(green.0, 0);
        assert_eq!(green.1, 255);
        assert_eq!(green.2, 0);
    }
}
#[test]
fn unit_structs() {
    // TODO: Instantiate a unit struct.
    // WARN: hi
    let unit_struct = UnitStruct;
    let message = format!("{:?}s are fun!", unit_struct);
    println!("{}", message);
    assert_eq!(message, "UnitStructs are fun!");
}
