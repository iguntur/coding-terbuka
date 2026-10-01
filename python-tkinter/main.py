import tkinter as tk
from tkinter import ttk

# 1. Create the main window
root = tk.Tk()
root.title("My First Tkinter App") # Set the window title
root.geometry("800x600") # Set the window size

def say_hi():
    print("Hello there")

# 2. Add a widget (a button)
button_exit = ttk.Button(root, text="Exit", command=root.destroy) # 'command' links to a function
button_say_hi = ttk.Button(root, text="Say Hi", command=say_hi)

# 3. Arrange the widget using a geometry manager
# button_exit.place(x=1, y=1)
# button_exit.grid(row=1, x=1, y=1)
button_exit.grid(row=0, column=1, padx=1, pady=1) # Use .grid() or .pack() or .place()
button_say_hi.grid(row=0, column=0, padx=100, pady=75) # Use .grid() or .pack() or .place()

# 4. Start the event loop to display the window
root.mainloop()
