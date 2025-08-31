
<div align="center">
  <h2>get_next_line - 42 project</h2>
  <img src="./img/get_next_line.png"  />
  <br>
</div>

![Language](https://img.shields.io/badge/language-C-blue)
![Norminette](https://img.shields.io/badge/norminette-passed-brightgreen)
![42](https://img.shields.io/badge/school-42-black)
![Status](https://img.shields.io/badge/status-completed-brightgreen)

> A custom implementation of a function that reads a line from a file descriptor, developed as part of the **École 42** curriculum.  
> The goal is to master static variables, memory allocation, and buffer management.

---

## 📖 Table of Contents
- [Description](#-description)
- [Features](#-features)
- [Installation](#%EF%B8%8F-installation)
- [Usage](#-usage)
- [Project Structure](#-project-structure)
- [Examples](#-examples)
- [Roadmap](#-roadmap)
- [Credits](#-credits)
- [License](#-license)

---

## 📝 Description
`get_next_line` implements a function that returns one line at a time from a given file descriptor.  
It manages internal buffers and keeps track of partially read data between calls.

This project teaches **file I/O**, **buffer management**, and **static variables** in C.

---

## ✨ Features
- ✅ Reads one line at a time from a file descriptor
- ✅ Handles multiple file descriptors simultaneously (Bonus part)
- ✅ Efficient buffer management
- ✅ Compatible with any file size
- ✅ Works with standard input (`stdin`)

---

## ⚙️ Installation
Requirements:  
- OS: Linux or macOS  
- C compiler (gcc, clang)  
- `make`

```bash
git clone https://github.com/LogUmi/get_next_line.git
cd get_next_line
make
```
or for the multiple fd version:
```
make bonus
```
This will generate a `libftgetnextline.a` file.

> ⚠️ no Makefile was required in the subject.

---

## 🖥 Usage
To use `get_next_line` in your own project, compile it and link it:

```bash
gcc main.c -L. -lft -o my_program
```
or
```bash
gcc main.c libftgetnextline.a -o my_program
```

In your source files, include the header:
```c
#include "get_next_line.h"
```
or for the multiple fd version:
```c
#include "get_next_line_bonus.h"
```

---

## 📂 Project Structure

```
.
├── img/                			# Content for README
├── includes/           			# Header files (.h)
├── srcs/              				# Source code (.c)
├── fr.subject_get_next_line.pdf	# Project 42 subject
├── Makefile
├── text.txt						#file used for example
└── README.md
```

---

## 🔎 Examples
To use `get_next_line` in your project:

```c
#include "includes/get_next_line.h"
#include <unistd.h> // pour close()
#include <fcntl.h>  // pour open()
#include <stdio.h>  // pour printf()

int main(void)
{
    int fd = open("text.txt", O_RDONLY);
    char *line;

    while ((line = get_next_line(fd)) != NULL)
        printf("%s", line);
    close(fd);
    return (0);
}
```
> Those version of get_next_line are using static memory allocation so you don't have to free the string `line`.
> Static memory variables are high settled in this version but in case you can check or change BUFFER_SIZE (size of buffer dedicated to `read()` function) and STATIC_SIZE (must sized for 4 max lines of your file).
> ```
> # ifndef BUFFER_SIZE
> #  define BUFFER_SIZE 42
> # endif
> ...
> # ifndef STATIC_SIZE
> #  define STATIC_SIZE 30000
> # endif
> ```
then compile & run:
```bash
gcc main.c libftgetnextline.a -o my_program
./my_program
```
Example output:
```
1 t'as rien de mieux a faire
2 ...
3 que de lire des textes
4
5 sans queue ni tete.
6 Tu ferais bien de te concentrer un peu plus sur le travail que tu dois faire bon sang de bon soir.
7 ca va durer encore longtemps ?
8 non plus tres longtemps...
9 jusqu'a 10...
10 a bon tout de meme pas trop tot.%
```

---

## 🚀 Roadmap
This project is the original version that was evaluated at 42 and will remain in this state.  

---

## 👤 Credits
Project developed by **Loïc Gérard** – 📧 Contact: lgerard@studend.42perpignan.fr - [École 42 Perpignan](https://42perpignan.fr).

---

## 📜 License
This project is licensed under the MIT License. You are free to use, modify, and distribute it.

> ⚠️ **Note for students**  
> If you are a student at 42 (or elsewhere), it is strongly recommended **not to copy/paste** this code.  
> Instead, try to **write your own solution** — it’s the only way to really learn and succeed.
