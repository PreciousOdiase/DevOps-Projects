# Linux Shell Scripting: Control Flow

This project documents my experience learning and applying **control flow concepts in shell scripting**. I practiced different types of loops and explored how they control the flow of execution in a script.

---

## What is Control Flow?

Control flow refers to the order in which instructions, statements, or function calls are executed or evaluated. In shell scripting, this typically involves **conditional statements** and **loops**, which allow a script to perform repetitive tasks and make decisions dynamically.

---

## Loops in Shell Scripting

### 1. Basic `for` Loop

This loop iterates over a list of items.

```bash
#!/bin/bash
for i in 1 2 3 4 5
do
  echo "Counting... $i"
done
```

📷 Screenshot of basic for loop execution:  
![Basic Loop](https://raw.githubusercontent.com/Samjean50/tech_env_setup/main/loop1.png)

---

### 2. `for` Loop Using a Range

This style simplifies looping over a sequence.

```bash
#!/bin/bash
for i in {1..5}
do
  echo "Counting... $i"
done
```

📷 Screenshot of range-based for loop:  
![Range Loop](https://raw.githubusercontent.com/Samjean50/tech_env_setup/main/loop2.png)

---

### 3. C-style `for` Loop

This loop mimics the C language syntax for more complex conditions.

```bash
#!/bin/bash
for (( i=0; i<5; i++ ))
do
  echo "Counting... $i"
done
```

📷 Screenshot of C-style for loop:  
![C-style Loop](https://raw.githubusercontent.com/Samjean50/tech_env_setup/main/loop3.png)

---

## Task Execution Summary

1. ✅ Created a shell script for each type of `for` loop.
2. ✅ Inserted the appropriate loop code into each file.
3. ✅ Set execution permissions using `chmod +x script_name.sh`.
4. ✅ Executed and tested each script on a Linux terminal.

---

## Reflections

- Learning about different control flow structures has made me more confident in automating tasks using bash.
- The ability to customize loop conditions helps handle a wide range of scenarios.
- Using C-style loops made me feel like combining the power of traditional programming logic with shell scripting simplicity.

---

🧠 Knowledge Gained:
- Syntax and usage of `for`, range-based, and C-style loops.
- Importance of file permissions (`chmod`) in executing scripts.
- Practical debugging of loop logic and script flow.

