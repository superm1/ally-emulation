#!/usr/bin/python3
import argparse

def read_strings_to_replace(file_path):
    with open(file_path, 'r') as file:
        return [line.strip() for line in file]

def replace_strings_in_file(input_file, strings_to_replace, replacement):
    with open(input_file, 'r') as file:
        content = file.read()

    for string in strings_to_replace:
        content = content.replace(string, replacement)

    with open(input_file, 'w') as file:
        file.write(content)

def main():
    parser = argparse.ArgumentParser(description='Replace strings in a file based on another file with newline-delimited strings.')
    parser.add_argument('strings_file', type=str, help='Path to the file with newline-delimited strings to replace')
    parser.add_argument('input_file', type=str, help='Path to the input file where replacements should be made')
    parser.add_argument('replacement', type=str, help='The string to replace all instances of the listed strings')

    args = parser.parse_args()

    strings_to_replace = read_strings_to_replace(args.strings_file)
    replace_strings_in_file(args.input_file, strings_to_replace, args.replacement)

if __name__ == "__main__":
    main()
