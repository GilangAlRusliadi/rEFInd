@echo off
:: Pastikan script dijalankan sebagai Administrator
:: Membuat drive R: mengakses EFI System Partition
mountvol R: /S

:: Menyalin direktori rEFInd ke ESP
xcopy /E "%~dp0refind" "R:\EFI\refind\"

:: Beralih ke drive R:
R:

:: Masuk ke direktori rEFInd
cd EFI\refind

:: Menghapus driver yang tidak diperlukan (modifikasi sesuai kebutuhan Anda)
:: (Opsional: tambahkan perintah untuk menghapus file di sini jika diperlukan)

:: Mengganti nama file konfigurasi
rename refind.txt refind.conf

:: Mengatur rEFInd sebagai boot manager default
bcdedit /set "{bootmgr}" path \EFI\refind\loader.efi

:: (Opsional) Mengatur deskripsi untuk boot manager
:: ganti "rEFInd description" sesuai kebutuhan
bcdedit /set "{bootmgr}" description "rEFInd Bootloader"

echo rEFInd installation is complete. Please reboot your computer.
:: pause

:: Menunggu input dari pengguna sebelum menutup jendela CMD
echo Press any key to exit...
pause >nul
