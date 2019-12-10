function Get-FuelUnit {
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true,
        ValueFromPipeline=$true,
        Position=0)
        ]
        [decimal]$moduleMass
    )
    process {
            [decimal]([System.Math]::Truncate( ($moduleMass / 3) ) - 2)     
    }
}

function Get-FuelCounterUpper2{
    [CmdletBinding()]
    param (
        [Parameter(Mandatory=$true,
        ValueFromPipeline=$true,
        Position=0)
        ]
        [decimal]$moduleMassArr
        )
    begin {
        $FuelTotal = [System.Collections.Generic.List[decimal]]::new()
    }

    Process {
        $FuelUnit = $ModuleMassArr | get-FuelUnit
        $FuelArr = [System.Collections.Generic.List[decimal]]::new()
        $FuelArr.Add($FuelUnit)
        While ($FuelUnit -gt 0){
            $FuelUnit = $FuelUnit | get-FuelUnit
            if ($FuelUnit -ge 0){
                $FuelArr.Add($FuelUnit)
            }
        }
        
        $FuelTotal.Add(($FuelArr | Measure-Object -Sum).sum)
    }

    end{
        [decimal]($FuelTotal | Measure-Object -sum).sum
    }
}

Get-Content .\TyrannyOfTheRocket-input.txt | Get-FuelCounterUpper2
