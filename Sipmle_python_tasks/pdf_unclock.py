import pikepdf

pdf_loc = 'Gahigi Bank Statement April 2023.pdf'
pdf_pass = '8729'

pdf = pikepdf.open(pdf_loc, password=pdf_pass)

print("\nProcessing...\n")

pdf_save = input("Save file as: ")
pdf_loc2 = input("Save location: ")

pdf.save(pdf_loc2 + '\\' + pdf_save)

print("The password successfully removed from the PDF")
print("\aLocation: " + pdf_loc + '\\' + pdf_save)
