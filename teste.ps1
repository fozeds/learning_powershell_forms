Add-Type -AssemblyName System.Windows.Forms

# Função para chamar o programa main.exe com os parâmetros especificados
function ChamarMain {
    param(
        [string]$param1,
        [string]$param2,
        [string]$param3,
        [string]$param4,
        [string]$param5
    )
    
    # Caminho para o executável main.exe
    $caminhoMain = ".\main.exe"
    
    # Construindo o comando com os parâmetros
    $comando = "$caminhoMain $param1 $param2 $param3 $param4 $param5"
    
    # Executando o comando
    Invoke-Expression -Command $comando
}

# Função para criar e exibir a interface gráfica
function ShowInterface {
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "Main Interface"
    $form.Size = New-Object System.Drawing.Size(300,250)
    $form.StartPosition = "CenterScreen"
    
    $label1 = New-Object System.Windows.Forms.Label
    $label1.Location = New-Object System.Drawing.Point(10,20)
    $label1.Size = New-Object System.Drawing.Size(280,20)
    $label1.Text = "Selecione a opção:"
    
    $comboBox = New-Object System.Windows.Forms.ComboBox
    $comboBox.Location = New-Object System.Drawing.Point(10,40)
    $comboBox.Size = New-Object System.Drawing.Size(280,20)
    $comboBox.Items.AddRange(@("Month", "Tir", "Update"))
    
    $button = New-Object System.Windows.Forms.Button
    $button.Location = New-Object System.Drawing.Point(90,70)
    $button.Size = New-Object System.Drawing.Size(120,30)
    $button.Text = "Selecionar"
    $button.Add_Click({
        switch ($comboBox.SelectedItem) {
            "Month" { ShowMonthOptionForm }
            "Tir" { ShowTirOptionForm }
            "Update" { ShowUpdateOptionForm }
        }
    })
    
    $form.Controls.Add($label1)
    $form.Controls.Add($comboBox)
    $form.Controls.Add($button)
    
    $form.ShowDialog() | Out-Null
}

# Função para a interface gráfica do MonthOption
function ShowMonthOptionForm {
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "Month Option"
    $form.Size = New-Object System.Drawing.Size(300,200)
    $form.StartPosition = "CenterScreen"
    
    $label1 = New-Object System.Windows.Forms.Label
    $label1.Location = New-Object System.Drawing.Point(10,20)
    $label1.Size = New-Object System.Drawing.Size(280,20)
    $label1.Text = "Digite o número do plano:"
    
    $textBox1 = New-Object System.Windows.Forms.TextBox
    $textBox1.Location = New-Object System.Drawing.Point(10,40)
    $textBox1.Size = New-Object System.Drawing.Size(280,20)
    
    $label2 = New-Object System.Windows.Forms.Label
    $label2.Location = New-Object System.Drawing.Point(10,70)
    $label2.Size = New-Object System.Drawing.Size(280,20)
    $label2.Text = "Digite o ano-mês (aaaa-mm):"
    
    $textBox2 = New-Object System.Windows.Forms.TextBox
    $textBox2.Location = New-Object System.Drawing.Point(10,90)
    $textBox2.Size = New-Object System.Drawing.Size(280,20)
    
    $button = New-Object System.Windows.Forms.Button
    $button.Location = New-Object System.Drawing.Point(90,130)
    $button.Size = New-Object System.Drawing.Size(120,30)
    $button.Text = "Executar"
    $button.Add_Click({
        ChamarMain "month" $textBox1.Text $textBox2.Text
        $form.Close()
    })
    
    $form.Controls.Add($label1)
    $form.Controls.Add($textBox1)
    $form.Controls.Add($label2)
    $form.Controls.Add($textBox2)
    $form.Controls.Add($button)
    
    $form.ShowDialog() | Out-Null
}

# Função para a interface gráfica do TirOption
function ShowTirOptionForm {
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "Tir Option"
    $form.Size = New-Object System.Drawing.Size(350,250)
    $form.StartPosition = "CenterScreen"
    
    $label1 = New-Object System.Windows.Forms.Label
    $label1.Location = New-Object System.Drawing.Point(10,20)
    $label1.Size = New-Object System.Drawing.Size(320,20)
    $label1.Text = "Digite o número do plano:"
    
    $textBox1 = New-Object System.Windows.Forms.TextBox
    $textBox1.Location = New-Object System.Drawing.Point(10,40)
    $textBox1.Size = New-Object System.Drawing.Size(320,20)
    
    $label2 = New-Object System.Windows.Forms.Label
    $label2.Location = New-Object System.Drawing.Point(10,70)
    $label2.Size = New-Object System.Drawing.Size(320,20)
    $label2.Text = "Digite a data inicial (aaaa-mm-dd):"
    
    $textBox2 = New-Object System.Windows.Forms.TextBox
    $textBox2.Location = New-Object System.Drawing.Point(10,90)
    $textBox2.Size = New-Object System.Drawing.Size(320,20)
    
    $label3 = New-Object System.Windows.Forms.Label
    $label3.Location = New-Object System.Drawing.Point(10,120)
    $label3.Size = New-Object System.Drawing.Size(320,20)
    $label3.Text = "Digite a data final (aaaa-mm-dd):"
    
    $textBox3 = New-Object System.Windows.Forms.TextBox
    $textBox3.Location = New-Object System.Drawing.Point(10,140)
    $textBox3.Size = New-Object System.Drawing.Size(320,20)
    
    $label4 = New-Object System.Windows.Forms.Label
    $label4.Location = New-Object System.Drawing.Point(10,170)
    $label4.Size = New-Object System.Drawing.Size(320,20)
    $label4.Text = "Digite o número do título:"
    
    $textBox4 = New-Object System.Windows.Forms.TextBox
    $textBox4.Location = New-Object System.Drawing.Point(10,190)
    $textBox4.Size = New-Object System.Drawing.Size(320,20)
    
    $button = New-Object System.Windows.Forms.Button
    $button.Location = New-Object System.Drawing.Point(110,220)
    $button.Size = New-Object System.Drawing.Size(120,30)
    $button.Text = "Executar"
    $button.Add_Click({
        ChamarMain "tir" $textBox1.Text $textBox2.Text $textBox3.Text $textBox4.Text
        $form.Close()
    })
    
    $form.Controls.Add($label1)
    $form.Controls.Add($textBox1)
    $form.Controls.Add($label2)
    $form.Controls.Add($textBox2)
    $form.Controls.Add($label3)
    $form.Controls.Add($textBox3)
    $form.Controls.Add($label4)
    $form.Controls.Add($textBox4)
    $form.Controls.Add($button)
    
    $form.ShowDialog() | Out-Null
}

# Função para a interface gráfica do UpdateOption
function ShowUpdateOptionForm {
    $form = New-Object System.Windows.Forms.Form
    $form.Text = "Update Option"
    $form.Size = New-Object System.Drawing.Size(300,200)
    $form.StartPosition = "CenterScreen"
    
    $label1 = New-Object System.Windows.Forms.Label
    $label1.Location = New-Object System.Drawing.Point(10,20)
    $label1.Size = New-Object System.Drawing.Size(280,20)
    $label1.Text = "Digite a opção de update (titles, shares, movements, totals):"
    
    $textBox1 = New-Object System.Windows.Forms.TextBox
    $textBox1.Location = New-Object System.Drawing.Point(10,40)
    $textBox1.Size = New-Object System.Drawing.Size(280,20)
    
    $button = New-Object System.Windows.Forms.Button
    $button.Location = New-Object System.Drawing.Point(90,90)
    $button.Size = New-Object System.Drawing.Size(120,30)
    $button.Text = "Executar"
    $button.Add_Click({
        ChamarMain "update" $textBox1.Text
        $form.Close()
    })
    
    $form.Controls.Add($label1)
    $form.Controls.Add($textBox1)
    $form.Controls.Add($button)
    
    $form.ShowDialog() | Out-Null
}

# Exibir a interface principal
ShowInterface