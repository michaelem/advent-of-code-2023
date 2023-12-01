use std::fs::File;
use std::io::{self, BufRead};
use std::path::Path;

use clap::Parser;

#[derive(Parser)]
struct Cli {
    path: std::path::PathBuf,
}

fn main() {
    let args = Cli::parse();

    if let Ok(lines) = read_lines(args.path) {
        let mut numbers: Vec<i64> = Vec::new();

        for line in lines {
            if let Ok(line) = line {
                let first_digit = find_first_digit(&line);
                let last_digit = find_last_digit(&line);
                

                if first_digit.is_none() || last_digit.is_none() {
                    println!("No digit found in line: {}", line);
                }
                else {
                    let combination = format!("{}{}", first_digit.unwrap(), last_digit.unwrap());
                    let number = combination.parse::<i64>().unwrap();
                    numbers.push(number);
                }
            }
        }
        println!("Sum of all numbers found: {}", numbers.iter().sum::<i64>());
    }
}


fn read_lines<P>(path: P) -> io::Result<io::Lines<io::BufReader<File>>>
where P: AsRef<Path>, {
    let file = File::open(path)?;
    Ok(io::BufReader::new(file).lines())
}

fn find_first_digit(sequence: &str) -> Option<String> {
    for c in sequence.chars() { 
        if c.is_digit(10) {
            return Some(c.to_string());
        }
    }
    return None;
}

fn find_last_digit(sequence: &str) -> Option<String> {
    let inverse = sequence.chars().rev().collect::<String>();
    return find_first_digit(&inverse);
}
