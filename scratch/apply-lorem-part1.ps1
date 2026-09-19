param()

$root = "C:\Anti-Gravity Skills\ev-solcap"

function ReplaceInFile($path, $oldText, $newText) {
    $content = [System.IO.File]::ReadAllText($path, [System.Text.Encoding]::UTF8)
    if ($content.Contains($oldText)) {
        $content = $content.Replace($oldText, $newText)
        [System.IO.File]::WriteAllText($path, $content, [System.Text.Encoding]::UTF8)
        Write-Host "  Replaced in: $([System.IO.Path]::GetFileName($path))"
    }
}

# ============================================
# 1. Update _data/sitetext.yml
# ============================================
$sitetextPath = "$root\_data\sitetext.yml"
Write-Host "Processing sitetext.yml..."

# Header text
ReplaceInFile $sitetextPath "Solomon Capital helps South African home buyers compare home-loan options, prepare stronger bond applications and understand the process from pre-qualification to registration. We are bond originators, not a lender, so approval, rates and terms remain subject to each bank's assessment." "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Solomon Capital provides comprehensive financial solutions to help you achieve your property goals."

# Expert text
ReplaceInFile $sitetextPath "A clear pre-qualification conversation can help you plan your budget, understand affordability and prepare for the documents lenders may request." "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt."

# No charge text
ReplaceInFile $sitetextPath "We earn a once-off fee from the bank when a qualifying home loan registers. Ask us what applies to your enquiry before you proceed." "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut enim ad minim veniam, quis nostrud exercitation ullamco."

# Services text
ReplaceInFile $sitetextPath "We assist home buyers, existing homeowners and self-employed applicants with practical bond origination support across South Africa, with a Durban-based team." "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Solomon Capital assists clients with tailored financial solutions across South Africa."

# Service descriptions
ReplaceInFile $sitetextPath "Before you start viewing properties, we help you understand your likely affordability range, the documents banks may request and the factors that can affect a home-loan application." "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut enim ad minim veniam, quis nostrud exercitation ullamco."
ReplaceInFile $sitetextPath "We prepare and submit your bond application to relevant banks, help compare offers and explain the next steps. Final approval, interest rates and conditions are determined by the lender." "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis aute irure dolor in reprehenderit in voluptate."
ReplaceInFile $sitetextPath "If you already have a home loan, we can help you ask the right refinancing or switching questions, understand the process and prepare an enquiry for lender assessment." "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Excepteur sint occaecat cupidatat non proident."

# Calculators text
ReplaceInFile $sitetextPath "Use these calculators to estimate affordability, monthly repayments and common bond-related costs. Calculator results are estimates and do not replace a lender assessment." "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Solomon Capital provides calculators to help you estimate your financial options."

# Calculator descriptions
ReplaceInFile $sitetextPath "Estimate how much home loan you may be able to afford." "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
ReplaceInFile $sitetextPath "Estimate monthly bond repayments at different loan amounts, terms and rates." "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
ReplaceInFile $sitetextPath "Estimate bond registration and transfer costs for a property purchase." "Ut enim ad minim veniam, quis nostrud exercitation ullamco."

Write-Host "Part 1 done."