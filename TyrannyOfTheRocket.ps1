function get-FuelCounter-Upper {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(Mandatory=$true,
        ValueFromPipeline=$true,
        Position=0)
        ]
        [decimal]$moduleMass
    )
    process {
            $item = ([System.Math]::Truncate( ($moduleMass / 3) ) - 2) 
            $toSum += $item
    }

    End{
        ($tosum | Measure-Object -sum).sum
        

        
    }

    
}

Get-Content .\TyrannyOfTheRocket-input.txt | get-FuelCounter-Upper
#100756 | get-FuelCounter-Upper


