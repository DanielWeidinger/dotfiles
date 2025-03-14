import json
import argparse


def convert_ipynb_to_py_with_cells(ipynb_filename, py_filename):
    with open(ipynb_filename, "r", encoding="utf-8") as f:
        notebook = json.load(f)

    with open(py_filename, "w", encoding="utf-8") as f:
        for cell in notebook["cells"]:
            if cell["cell_type"] == "code":
                f.write("# %%\n")
                f.write("\n".join(cell["source"]) + "\n\n")
            elif cell["cell_type"] == "markdown":
                f.write("# %% [markdown]\n")
                # Ensure markdown cells are commented out correctly
                f.write(
                    "".join(
                        [
                            "# " + line if not line.startswith("#") else "#" + line
                            for line in cell["source"]
                        ]
                    )
                    + "\n\n"
                )


def main():
    parser = argparse.ArgumentParser(
        description="Convert .ipynb to .py with cell annotations."
    )
    parser.add_argument(
        "path", type=str, help="Path to the .ipynb file to be converted."
    )

    args = parser.parse_args()
    ipynb_filename = args.path
    py_filename = (
        ipynb_filename.rsplit(".", 1)[0] + ".py"
    )  # Change the extension to .py

    convert_ipynb_to_py_with_cells(ipynb_filename, py_filename)
    print(f"Converted {ipynb_filename} to {py_filename}.")


if __name__ == "__main__":
    main()
