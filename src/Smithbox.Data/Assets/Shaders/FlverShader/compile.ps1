$fileNames = Get-ChildItem -Path $scriptPath

foreach ($file in $fileNames)
{
    if ($file.Name.EndsWith("vert") -Or $file.Name.EndsWith("frag") -Or $file.Name.EndsWith("comp"))
    {
        Write-Host "Compiling $file"
        glslangvalidator -V $file -o $file".spv"
    }
}

..\..\..\..\Veldrid\Veldrid.SPIRV.VariantCompiler\bin\Debug\net8.0\Veldrid.SPIRV.VariantCompiler.exe --search-path .\ --output-path .\ --set .\FlverShader.json