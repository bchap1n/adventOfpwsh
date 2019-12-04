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
    begin {$list = [System.Collections.Generic.List[int]]::new()}
    process {
            $fuelRequired = ([System.Math]::Truncate( ($moduleMass / 3) ) - 2)     
            $list.Add("$fuelRequired") 
    }

    End{
        ($list | Measure-Object -sum).sum    
    }
}

Get-Content .\TyrannyOfTheRocket-input.txt | get-FuelCounter-Upper




