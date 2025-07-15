# WinRepair

## Опис (Українська)

WinRepair — невелика утиліта для перевірки та відновлення цілісності системних файлів Windows за допомогою вбудованих інструментів `sfc` та `dism`.  
Створена для автоматизації процесу ремонту системи після збоїв оновлень Windows.

### Функції

- Автоматичний запуск з правами адміністратора
- Меню з простими опціями:
  - [1] Перевірка `sfc /scannow`
  - [2] Швидка перевірка DISM (`CheckHealth`)
  - [3] Повна перевірка та відновлення DISM (`RestoreHealth`)
  - [6] Повна послідовність: `SFC → DISM → SFC → DISM → Перезавантаження`
  - [4] Вихід, [5] Перезавантаження системи
- Пауза після кожного кроку для перегляду результатів

### Використання

1. Завантажте файл `winrepair.bat`  
2. Запустіть його від імені адміністратора  
3. Оберіть потрібний пункт меню та слідуйте інструкціям

---

## Description (English)

WinRepair is a small utility for checking and repairing Windows system file integrity using the built-in `sfc` and `dism` tools.  
It was created to automate system repair processes after Windows update failures.

### Features

- Automatically runs with administrator privileges  
- Simple menu options:  
  - [1] Run `sfc /scannow`  
  - [2] Quick DISM check (`CheckHealth`)  
  - [3] Full DISM repair (`RestoreHealth`)  
  - [6] Full sequence: `SFC → DISM → SFC → DISM → Reboot`  
  - [4] Exit, [5] Reboot system  
- Pauses after each step to review results

### Usage

1. Download the `winrepair.bat` file  
2. Run it as Administrator  
3. Choose the desired menu option and follow instructions

---

## License

MIT License. See [LICENSE](./LICENSE) file for details.
