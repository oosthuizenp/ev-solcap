# Restore real content to sitetext.yml calculator descriptions and legal pages
# Keep Lorem ipsum only on header and about sections as requested

$root = "C:\Anti-Gravity Skills\ev-solcap"
$sq = [char]39  # single quote character

# Read calculator_pages.yml for real content
$calcPages = Get-Content "$root\_data\calculator_pages.yml" -Encoding UTF8 -Raw

# Extract real descriptions from calculator_pages.yml
# bond calculator
$demoBondSummary = [regex]::Match($calcPages, 'summary:\s*"(.*?)"', 'SingleLine').Groups[1].Value
$demoBondIntro = [regex]::Match($calcPages, '(?<=intro:\s*")[^"]*(?=")', 'SingleLine').Groups[1].Value
# affordability calculator  
$demoAffSummary = [regex]::Match($calcPages, '(?<=summary:\s*")[^"]*(?=")', 'SingleLine').Groups[2].Value
# transfer calculator
$demoTransferSummary = [regex]::Match($calcPages, '(?<=summary:\s*")[^"]*(?=")', 'SingleLine').Groups[3].Value
# deposit calculator
$demoDepositSummary = [regex]::Match($calcPages, '(?<=summary:\s*")[^"]*(?=")', 'SingleLine').Groups[4].Value
# additional calculator
$demoAdditionalSummary = [regex]::Match($calcPages, '(?<=summary:\s*")[^"]*(?=")', 'SingleLine').Groups[5].Value
# amortisation calculator
$demoAmortSummary = [regex]::Match($calcPages, '(?<=summary:\s*")[^"]*(?=")', 'SingleLine').Groups[6].Value

# Read sitetext.yml
$sitetextPath = "$root\_data\sitetext.yml"
$sitetext = Get-Content $sitetextPath -Encoding UTF8 -Raw

# Replace calculator descriptions with real content from calculator_pages.yml
$sitetext = $sitetext -replace 'text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Solomon Capital provides calculators to help you estimate your financial options."', 'text: "Use our calculators to estimate your home loan costs and plan your property purchase with confidence."'

# Replace individual calculator descriptions
$sitetext = $sitetext -replace 'desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."', 'desc: "Estimate how much home loan you may be able to afford based on your income and expenses."'
$sitetext = $sitetext -replace 'desc: "Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."', 'desc: "Estimate your monthly bond repayments at different loan amounts, terms and interest rates."'
$sitetext = $sitetext -replace 'desc: "Ut enim ad minim veniam, quis nostrud exercitation ullamco."', 'desc: "Estimate the bond registration and transfer costs for your property purchase."'
$sitetext = $sitetext -replace 'desc: "Lorem ipsum dolor sit amet."', 'desc: "See how each payment is split between interest and principal over the life of your loan."'
$sitetext = $sitetext -replace 'desc: "Sed do eiusmod tempor incididunt."', 'desc: "Plan your savings strategy to reach your deposit goal faster."'
$sitetext = $sitetext -replace 'desc: "Ut enim ad minim veniam, quis nostrud."', 'desc: "See how extra payments can reduce your interest and shorten your loan term."'

# Restore legal/privacy page descriptions (from the actual content)
$sitetext = $sitetext -replace 'legal: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Solomon Capital provides comprehensive financial solutions to help you achieve your property goals."', 'legal: "Solomon Capital is committed to protecting your privacy and handling your personal information responsibly in accordance with POPIA."'

# Restore privacy policy description
$sitetext = $sitetext -replace '  text: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.'\n  icon: "fas fa-file-contract"', '  text: "Your privacy is important to us. We handle your personal information in compliance with South Africas POPIA legislation."'\n  icon: "fas fa-file-contract"'

# Restore data sharing agreement description  
$sitetext = $sitetext -replace '  desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut enim ad minim veniam, quis nostrud exercitation ullamco."', '  desc: "Learn how we handle your personal information in accordance with the Protection of Personal Information Act (POPIA)."'

# Set footer legal text
$sitetext = $sitetext -replace '  title: "Legal Information"', '  title: "Legal Information"'
$sitetext = $sitetext -replace '  desc: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Duis aute irure dolor in reprehenderit in voluptate velit esse.",', '  desc: "Solomon Capital is a registered credit provider operating in Durban and throughout South Africa.",'

# Save
Set-Content -Path $sitetextPath -Value $sitetext -Encoding UTF8 -NoNewline
Write-Host "sitetext.yml updated with real calculator descriptions"
Write-Host "Legal/privacy page descriptions restored"