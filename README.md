# Niaz Translate

A lightweight Linux translation utility that translates selected text using the **Lara Translate API** and displays the result through **Rofi**.

The script is designed primarily for **Wayland-based Linux environments** such as Hyprland and uses `wl-paste` / `wl-copy` to work with the selected text.

---

## ✨ Features

* Translate selected text to Persian
* Uses [Lara Translate](https://app.laratranslate.com/) API
* Simple Rofi interface
* Copy translated text directly to clipboard
* Works with keyboard shortcuts
* Lightweight and fast
* No need for `dotenv`
* API credentials are stored locally in `.env`

---

## 🛠 Requirements

Before installing the project, make sure the following dependencies are installed on your system.

### Required

* Node.js
* npm
* Rofi
* SwayNC
* `wl-clipboard`
* A Wayland compositor

For example, on Arch Linux:

```bash
sudo pacman -S nodejs npm rofi swaync wl-clipboard
```

> **Note:** SwayNC is used for notifications. If you don't need notification messages, the script can be adapted to use another notification daemon.

---

## 📦 Installation

### 1. Clone the repository

Clone the project into:

```bash
~/.local/bin/niaz-translate
```

For example:

```bash
git clone git@github.com:AMIR-NIAZ/niaz-translate.git ~/.local/bin/niaz-translate
```

Then enter the project:

```bash
cd ~/.local/bin/niaz-translate
```

---

### 2. Install Node.js dependencies

Run:

```bash
npm i
```

This installs the required Node.js packages.

---

## 🔑 Configure Lara Translate

Niaz Translate uses **Lara Translate** for translation.

First, create an account and get your API credentials from:

https://app.laratranslate.com/

You need your:

* Token ID
* Token Key

Create a `.env` file inside the project:

```bash
nano ~/.local/bin/niaz-translate/.env
```

Add:

```env
export LARA_TOKEN_ID="YOUR_TOKEN_ID"
export LARA_TOKEN_KEY="YOUR_TOKEN_KEY"
```

Replace the values with your actual Lara credentials.

### Protect your credentials

Make the `.env` file readable only by your user:

```bash
chmod 600 ~/.local/bin/niaz-translate/.env
```

**Never commit `.env` to Git.**

The project already ignores it through `.gitignore`:

```gitignore
node_modules/
.env
```

---

## ▶️ Test the Translator

You can test the Node.js translator directly:

```bash
node ~/.local/bin/niaz-translate/translater-api.js "Hello World"
```

If everything is configured correctly, you should receive the Persian translation.

---

## 🖱️ Make the Script Executable

The translation script needs execute permission:

```bash
chmod +x ~/.local/bin/niaz-translate/translate-selection.sh
```

You can then run it manually:

```bash
~/.local/bin/niaz-translate/translate-selection.sh
```

---

## ⌨️ Configure a Keyboard Shortcut

The script is designed to be triggered using a keyboard shortcut.

For example, in **Hyprland**, add a key binding to your Hyprland configuration.

Example:

```lua
hl.bind(
    "F10",
    hl.dsp.exec_cmd(
        os.getenv("HOME") .. "/.local/bin/niaz-translate/translate-selection.sh"
    )
)
```

After changing your configuration, reload Hyprland:

```bash
hyprctl reload
```

Now the workflow is:

1. Select some text.
2. Press your configured key.
3. Niaz Translate reads the selected text.
4. The text is sent to Lara Translate.
5. The Persian translation is displayed using Rofi.
6. Selecting the copy option copies the translation to the clipboard.

---

## 🖥️ Wayland Compatibility

Niaz Translate uses:

```bash
wl-paste
wl-copy
```

Therefore, the current implementation is intended for **Wayland** environments.

It is not tied exclusively to Hyprland. The translation script can be used with other Wayland compositors as long as the required dependencies are available.

Examples:

* Hyprland
* Sway
* Wayfire
* Other Wayland compositors

The keyboard shortcut configuration, however, depends on your window manager/compositor.

---

## 📁 Project Structure

```text
niaz-translate/
├── node_modules/
├── .env
├── .gitignore
├── package.json
├── package-lock.json
├── translater-api.js
├── translate-selection.sh
└── translation.rasi
```

### `translater-api.js`

Handles communication with the Lara Translate API and returns the translated text.

### `translate-selection.sh`

Handles the complete translation workflow:

```text
Selected Text
     ↓
wl-paste
     ↓
Lara Translate
     ↓
Rofi
     ↓
wl-copy
```

### `translation.rasi`

Contains the Rofi theme and appearance configuration for the translation interface.

---

## 🔒 Security

Your Lara credentials are stored in:

```text
~/.local/bin/niaz-translate/.env
```

Never put your credentials directly inside:

```text
translater-api.js
```

Never commit `.env` to GitHub.

If your credentials are accidentally exposed, revoke them from your Lara Translate account and generate new credentials.

---

## 🚀 Quick Setup

For an already configured system, the basic setup is:

```bash
git clone git@github.com:AMIR-NIAZ/niaz-translate.git ~/.local/bin/niaz-translate

cd ~/.local/bin/niaz-translate

npm i

nano .env

chmod 600 .env

chmod +x translate-selection.sh
```

Then configure your keyboard shortcut and you're ready to use Niaz Translate.

---

## 📄 License

This project is open source. See the repository for license information.
