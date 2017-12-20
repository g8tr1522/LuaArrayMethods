print()

lam = require('lam')


t = lam.new("range", -3,1,0.5)
print("values in t:",table.unpack(t.table))

print()
print("printing locations:")
print("~~~ lam               ",tostring(lam))
print("  ~ lam.methods       ",tostring(lam.methods))
print("  ~ lam.methods.add   ",tostring(lam.methods.add))
print("  ~ lam.methods.add_  ",tostring(lam.methods.add_))
print()
print("~~~ t", tostring(t))
print("  ~ t.add             ", tostring(t.add))
print("  ~ t.add_            ", tostring(t.add_))
print("===================================================")







