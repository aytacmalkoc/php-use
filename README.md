# PHP Use for Windows

A simple tool that allows you to easily switch between multiple PHP versions on Windows. Works with both Windows Command Prompt and Git Bash.

## Features

- ✅ Easy switching between multiple PHP versions
- ✅ Windows Command Prompt support
- ✅ Git Bash support
- ✅ Automatic PATH management
- ✅ Compatible with Composer and other PHP tools

## Installation

1. Clone or download this repository:
```bash
git clone https://github.com/aytacmalkoc/php-use.git
cd php-use
```

2. Open `bin/php-use.bat` and edit the paths to your PHP versions:
```batch
SET PHP_73=C:\laragon\bin\php\php-7.3.33-nts-Win32-VC15-x64
SET PHP_82=C:\laragon\bin\php\php-8.2.27-nts-Win32-vs16-x64
SET PHP_83=C:\laragon\bin\php\php-8.3.26-Win32-vs16-x64
SET PHP_84=C:\laragon\bin\php\php-8.4.14-nts-Win32-vs17-x64
```

3. On first use, run `bin/php-use.bat` to add the `bin` directory to PATH:
```bash
bin\php-use.bat 8.4
```

4. Open a new terminal window (required for PATH updates)

### Setting up `php-use` alias (Optional)

To use `php-use` as a shorter command instead of `php-use.bat`, you can create an alias or add it to your PATH:

**Windows Command Prompt:**
- The `php-use\bin` folder will be automatically added to PATH when you first run `php-use.bat`
- After opening a new terminal, you can use: `php-use 8.4` (without `.bat` extension if you have file extensions enabled)

**Git Bash:**
Add this line to your `~/.bashrc` or `~/.bash_profile`:
```bash
alias php-use='/c/path/to/php-use/bin/php-use.bat'
```

After adding the alias, reload your shell configuration:
```bash
source ~/.bashrc
# or
source ~/.bash_profile
```

Now you can use: `php-use 8.4`

## Usage

### Switching PHP Versions

```bash
php-use.bat 8.4    # Switch to PHP 8.4
php-use.bat 8.3    # Switch to PHP 8.3
php-use.bat 8.2    # Switch to PHP 8.2
php-use.bat 7.3    # Switch to PHP 7.3
```

Or if you've set up the alias:
```bash
php-use 8.4
```

### Using PHP Command

After switching versions, open a new terminal and you can use the `php` command directly:

```bash
php --version
php -v
composer require vendor/package
```

## File Structure

```
php-use/
├── bin/
│   ├── php-use.bat   # PHP version switcher script (Windows)
│   ├── php.bat        # PHP wrapper for Windows Command Prompt
│   └── php            # PHP wrapper script for Git Bash
├── LICENSE
├── README.md
└── .gitignore
```

## How It Works?

1. When `php-use.bat` is run, the selected PHP version's path is saved to the `PHP_PATH` user environment variable.
2. The `php.bat` (Windows) and `php` (Git Bash) scripts read this environment variable and execute the correct PHP version.
3. On first run, the `php-use\bin` folder is automatically added to PATH.

## Setting Your Own PHP Paths

Open `bin/php-use.bat` and edit the `SET PHP_XX=` lines according to your PHP installation paths:

```batch
SET PHP_73=C:\path\to\your\php-7.3
SET PHP_82=C:\path\to\your\php-8.2
SET PHP_83=C:\path\to\your\php-8.3
SET PHP_84=C:\path\to\your\php-8.4
```

To add new PHP versions, add a new `IF` block:

```batch
ELSE IF "%1"=="8.1" (
    SETX PHP_PATH "%PHP_81%"
    echo Switched to PHP 8.1
)
```

## Troubleshooting

### Getting "php: command not found" error

- Try opening a new terminal window (required for PATH updates)
- Make sure you've run `php-use.bat` at least once
- To manually add to PATH: `set PATH=%PATH%;C:\php-use\bin`

### Not working in Git Bash

- Make sure the `php` file is executable: `chmod +x bin/php`
- Open a new Git Bash window

### Composer can't find PHP

- Before running `composer`, verify PHP is working with `php --version`
- Open a new terminal window

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Contributing

Pull requests are welcome! For major changes, please open an issue first to discuss what you would like to change.

## Acknowledgments

This tool was developed to make working with multiple PHP versions on Windows easier.
