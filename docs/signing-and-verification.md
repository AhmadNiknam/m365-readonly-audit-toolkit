# Signing and Verification

This project uses two separate signing mechanisms:

## 1. Git commit and tag signing

Git commits and release tags are signed and verified in GitHub to help confirm authorship and release integrity.

## 2. PowerShell Authenticode signing

PowerShell files in the `src` folder are digitally signed with Authenticode to support local signature verification.

## Public certificate

The public code-signing certificate is included in this repository:

- `signing/AhmadNiknam-CodeSigning.cer`

This file can be used for signature verification and trust import on test systems.

## Sensitive files

Private certificate files such as `.pfx` and `.p12` are not included in the repository and must never be committed.

## Verification examples

### Verify a PowerShell script signature

```powershell
Get-AuthenticodeSignature .\src\main.ps1