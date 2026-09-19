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

$sitetextPath = "$root\_data\sitetext.yml"

# Team - Replace Eveshan with Sihle Ndlela
ReplaceInFile $sitetextPath "Eveshan<br>Venkatasami" "Sihle<br>Ndlela"
ReplaceInFile $sitetextPath "Dedicated to providing personalised financial solutions and guiding clients through the bond application process." "Lorem ipsum dolor sit amet, consectetur adipiscing elit."

# Office Hours bio
ReplaceInFile $sitetextPath "Mon to Fri: 9 AM to 5 PM<br>Sat, Sun & Public Holidays: Closed<br>Need urgent assistance after hours? Contact Eveshan Venkatasami directly on 061 206 6724." "Mon to Fri: 9 AM to 5 PM<br>Sat, Sun & Public Holidays: Closed<br>Need urgent assistance after hours? Contact Sihle Ndlela directly on +27 69 443 0046."

# Eveshan phone numbers -> Sihle phone
ReplaceInFile $sitetextPath "tel:+27612066724" "tel:+27694430046"
ReplaceInFile $sitetextPath "https://wa.me/+27612066724" "https://wa.me/+27694430046"

# Venetia bio
ReplaceInFile $sitetextPath "Assists clients with home-loan origination support and application coordination." "Lorem ipsum dolor sit amet, consectetur adipiscing elit."

# Kaylene bio and email
ReplaceInFile $sitetextPath "Helps clients navigate home-finance enquiries and prepare for lender assessment." "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
ReplaceInFile $sitetextPath "mailto:Kaylene.firstclass@evogroup.co.za" "mailto:Info@solomoncapital.co.za"

# FAQ answer - replace Eveshan with Sihle (already done above for name)
# FAQ answers -> lorem ipsum
ReplaceInFile $sitetextPath "Pre-qualification is an early affordability discussion based on information such as income, expenses, credit profile and deposit. It helps you plan before making an offer, but it is not a final loan approval." "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed do eiusmod tempor incididunt."
ReplaceInFile $sitetextPath "Banks commonly request identity documents, recent payslips or income proof, bank statements, details of monthly expenses, the signed Offer to Purchase and property information. Self-employed applicants may need additional business and tax documents." "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris."
ReplaceInFile $sitetextPath "Timing varies by lender, application complexity and document readiness. A complete application can move faster, but final approval and registration remain subject to bank and conveyancing processes." "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum."
ReplaceInFile $sitetextPath "Yes, self-employed applicants can apply. Lenders usually require more detailed income and business documentation to assess affordability and risk." "Excepteur sint occaecat cupidatat non proident, sunt in culpa."
ReplaceInFile $sitetextPath "No. Solomon Capital can help prepare and submit an application, but credit approval, rates and conditions are decided by the lender." "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Solomon Capital helps."

# Contact text
ReplaceInFile $sitetextPath "Ask a home-loan question, request pre-qualification guidance or start a bond enquiry." "Lorem ipsum dolor sit amet, consectetur adipiscing elit."

Write-Host "Part 3 done."