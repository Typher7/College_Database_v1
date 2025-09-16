Place your EER diagram screenshots in this folder so they render in the project README.

Recommended filename:
- `Screenshot 2025-09-16 023136.png`

To add the image from your Windows machine:
1. Open PowerShell (pwsh) and run:
   ```powershell
   mkdir -Force .\images
   cp "D:\Pictures\Screenshots\Screenshot 2025-09-16 023136.png" .\images\
   ```
2. Commit the image:
   ```powershell
   git add images\"Screenshot 2025-09-16 023136.png"
   git commit -m "Add EER diagram screenshot"
   git push
   ```

If you prefer, rename the file to a simpler name (e.g. `eer-diagram.png`) and update `README.md` accordingly.