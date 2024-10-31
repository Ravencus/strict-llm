# Lean Code Compilation and Analysis Tool

## Overview

This project provides a Python script that automates the compilation of Lean code, parses the compiler's output, and presents errors and goals in a user-friendly format that can be understood by LLMs. 

## Prerequisites

Before setting up the tool, ensure that your system meets the following requirements:

- **Python**: Version 3.10.15.
- **Lean**: Version 4.12.0.

## Features

1. **Lean Code Input Handling**: The script can take Lean code as a string or read it from a `.lean` file.
2. **Compilation**: It uses the `lean` command-line tool to compile the code.
3. **Error Parsing**: When compilation fails, the script extracts and formats errors, displaying detailed messages including file name, line, column, and error descriptions.
4. **Goal Detection**: The script also identifies any goals the compiler encounters.

