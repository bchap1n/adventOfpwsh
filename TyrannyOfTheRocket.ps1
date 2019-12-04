function get-FuelCounter-Upper {
    [CmdletBinding()]
    param (
        # Parameter help description
        [Parameter(Mandatory=$true,
        ValueFromPipeline=$true,
        Position=0)
        ]
        [int[]]
        $moduleMass
    )
    process {
        $foreach ($item in $moduleMass) {
            ([System.Math]::Truncate( ($item / 3) ) - 2)
        }
    }
    
}

Get-Content .\TyrannyOfTheRocket-input.txt | get-FuelCounter-Upper
#100756 | get-FuelCounter-Upper