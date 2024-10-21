#!/usr/bin/python3
import argparse
import base64

def encode_file_to_base64(input_file, output_file):
    with open(input_file, 'r') as f:
        lines = f.readlines()
    
    with open(output_file, 'w') as f:
        for line in lines:
            encoded_line = base64.b64encode(bytes.fromhex(line.strip())).decode('utf-8')
            f.write(encoded_line + '\n')

def main():
    parser = argparse.ArgumentParser(description='Encode a file with newline-delimited strings to Base64.')
    parser.add_argument('input_file', type=str, help='Path to the input file')
    parser.add_argument('output_file', type=str, help='Path to the output file')
    args = parser.parse_args()
    
    encode_file_to_base64(args.input_file, args.output_file)

if __name__ == "__main__":
    main()
