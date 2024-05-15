<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="checkOTP.aspx.cs" Inherits="WebApplication1.aspx.checkOTP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>OTP Verification</title>
    <meta name="viewport" content="width=device-width,initial-scale=1">
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;700&display=swap" rel="stylesheet" />
    <script src="https://cdn.tailwindcss.com"></script>
    <script defer src="https://cdn.jsdelivr.net/npm/alpinejs@3.x.x/dist/cdn.min.js"></script>
    <script>
        tailwind.config = {
            theme: {
                extend: {
                    fontFamily: {
                        inter: ['Inter', 'sans-serif'],
                    },
                },
            },
        };
    </script>
</head>

<body>
    <br />
    <br />
    <br />
    <br />
    <br />

        <div class="max-w-md mx-auto text-center bg-white px-4 sm:px-8 py-10 rounded-xl shadow" style="border:groove;">
            <header class="mb-8">
                <h1 class="text-2xl font-bold mb-1">OTP Verification</h1>
                <p class="text-[15px] text-slate-500">Enter the 4-digit verification code that was sent to your email.</p>
            </header>
            <form id="form1" runat="server">
                <div>
                    <asp:TextBox ID="otpInput" runat="server" MaxLength="5" BorderColor="Black" BorderStyle="Groove" BackColor="#ccffff" placeholder="Enter OTP Here" style="text-align: center;"></asp:TextBox>
                    <br />
                    <asp:RegularExpressionValidator ID="revOTP" runat="server" ErrorMessage="Only digit is acceptable !!" ControlToValidate="otpInput" Display="Dynamic" Font-Bold="True" ForeColor="Red" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                </div>
                <div class="max-w-[260px] mx-auto mt-4">
                    <asp:Button ID="otpSubmit" runat="server" Text="Verify Code" CssClass="w-full inline-flex justify-center whitespace-nowrap rounded-lg bg-indigo-500 px-3.5 py-2.5 text-sm font-medium text-white shadow-sm shadow-indigo-950/10 hover:bg-indigo-600 focus:outline-none focus:ring focus:ring-indigo-300 focus-visible:outline-none focus-visible:ring focus-visible:ring-indigo-300 transition-colors duration-150" OnClick="otpSubmit_Click"/>
                </div>
                <asp:Label ID="lblVerify" runat="server" Text=""></asp:Label>
            </form>
            <div class="text-sm text-slate-500 mt-4">Didn't receive code? <a class="font-medium text-indigo-500 hover:text-indigo-600" href="../aspx/resendOTP.aspx">Resend</a></div>
        </div>

        <script>
            document.addEventListener('DOMContentLoaded', () => {
                const form = document.getElementById('otp-form')
                const inputs = [...form.querySelectorAll('input[type=text]')]
                const submit = form.querySelector('button[type=submit]')

                const handleKeyDown = (e) => {
                    if (
                        !/^[0-9]{1}$/.test(e.key)
                        && e.key !== 'Backspace'
                        && e.key !== 'Delete'
                        && e.key !== 'Tab'
                        && !e.metaKey
                    ) {
                        e.preventDefault()
                    }

                    if (e.key === 'Delete' || e.key === 'Backspace') {
                        const index = inputs.indexOf(e.target);
                        if (index > 0) {
                            inputs[index - 1].value = '';
                            inputs[index - 1].focus();
                        }
                    }
                }

                const handleInput = (e) => {
                    const { target } = e
                    const index = inputs.indexOf(target)
                    if (target.value) {
                        if (index < inputs.length - 1) {
                            inputs[index + 1].focus()
                        } else {
                            submit.focus()
                        }
                    }
                }

                const handleFocus = (e) => {
                    e.target.select()
                }

                const handlePaste = (e) => {
                    e.preventDefault()
                    const text = e.clipboardData.getData('text')
                    if (!new RegExp(`^[0-9]{${inputs.length}}$`).test(text)) {
                        return
                    }
                    const digits = text.split('')
                    inputs.forEach((input, index) => input.value = digits[index])
                    submit.focus()
                }

                inputs.forEach((input) => {
                    input.addEventListener('input', handleInput)
                    input.addEventListener('keydown', handleKeyDown)
                    input.addEventListener('focus', handleFocus)
                    input.addEventListener('paste', handlePaste)
                })
            })
        </script>
</body>
</html>
