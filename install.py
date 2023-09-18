import os

def fn_install():
    install = "mv fonts ~/.local/share/"
    try:
        os.system(install)
        print("Fonts moved successfully...")
        return True
    except Exception as e:
        print(f"Failed to move fonts: {e}")
        return False

def fn_load():
    fc = "fc-cache -fv"
    try:
        os.system(fc)
        print("Updating font cache...")
        return True
    except Exception as e:
        print(f"Failed to update font cache: {e}")
        return False

if fn_install():
    if fn_load():
        print("Fonts successfully installed!")
    else:
        print("Failed to update font cache.")
else:
    print("Failed to install fonts.")
