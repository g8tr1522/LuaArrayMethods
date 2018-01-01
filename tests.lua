print()

lam = require('lam')


t = lam.new("range", -3,1,0.5)
print("values in t:",table.unpack(t.table))

print()
print("printing locations:")
print("~~~ lam                       ",tostring(lam))
print("  ~ lam.object_methods        ",tostring(lam.object_methods))
print("  ~ lam.object_methods.add   ",tostring(lam.object_methods.add))
print("  ~ lam.object_methods.add_  ",tostring(lam.object_methods.add_))
print()
print("~~~ t", tostring(t))
print("  ~ t.add             ", tostring(t.add))
print("  ~ t.add_            ", tostring(t.add_))
print("===================================================")







