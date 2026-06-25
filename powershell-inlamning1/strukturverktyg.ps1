# En loop som snurrar tills mappen skapas utan fel
while ($true) {
    
    $MappNamn = Read-Host "Vad vill du att din mapp ska heta?"

    # Felhantering 1: Om man bara trycker Enter
    if ($MappNamn -eq "") {
        Write-Host "Nu vart det något fel, försökt igen."
        continue # 'continue' gör att loopen börjar om direkt
    }

    # Felhantering 2: Om mappen redan finns
    if (Test-Path $MappNamn) {
        Write-Host "Fel: Mappen '$MappNamn' finns redan!"
        continue 
    }

    # Försöker skapa mapparna
    try {
        # -Force skapar även huvudmappen. -ErrorAction Stop ser till att catch fångar eventuella fel.
        $null = New-Item -Path "$MappNamn\logs" -ItemType Directory -Force -ErrorAction Stop
        $null = New-Item -Path "$MappNamn\scripts" -ItemType Directory -Force -ErrorAction Stop
        $null = New-Item -Path "$MappNamn\temp" -ItemType Directory -Force -ErrorAction Stop

        # Skapar textfilen
        "Struktur skapad: $(Get-Date)" | Out-File "$MappNamn\logs\logg.txt"

        Write-Host "Klart! Mapparna och loggfilen är skapade."
        
        break # 'break' avslutar loopen eftersom vi är klara
    }
    catch {
        # Fångar upp andra fel, t.ex. om namnet innehåller otillåtna tecken
        Write-Host "Ett oväntat fel uppstod: $_"
        # Eftersom inget 'break' körs här, börjar loopen om automatiskt så du får en ny chans
    }
}