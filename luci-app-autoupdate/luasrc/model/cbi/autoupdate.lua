require("luci.sys")

m=Map("autoupdate",translate("AutoUpdate"),translate("AutoUpdate LUCI supports one-click firmware upgrade and scheduled upgrade"))

s=m:section(TypedSection,"common","")
s.addremove=false
s.anonymous=true

o = s:option(Flag, "enable", translate("Enable AutoUpdate"),translate("Automatically update firmware during the specified time"))
o.default = 0
o.optional = false
o = s:option(Flag, "enable_proxy", translate("Preference Proxy"),translate("Preference use [FastGit] to speed up downloads"))
o.default = 0
o.optional = false
o = s:option(Flag, "force_write", translate("Force Write"),translate("Preference Force Write to upgrade firmware"))
o.default = 0
o.optional = false

week=s:option(ListValue,"week",translate("xWeek Day"))
week:value(7,translate("Everyday"))
week:value(1,translate("Monday"))
week:value(2,translate("Tuesday"))
week:value(3,translate("Wednesday"))
week:value(4,translate("Thursday"))
week:value(5,translate("Friday"))
week:value(6,translate("Saturday"))
week:value(0,translate("Sunday"))
week.default=0

hour=s:option(Value,"hour",translate("xHour"))
hour.datatype = "range(0,23)"
hour.rmempty = false

pass=s:option(Value,"minute",translate("xMinute"))
pass.datatype = "range(0,59)"
pass.rmempty = false

local github_url = luci.sys.exec("bash /bin/AutoUpdate.sh --var Github")
o=s:option(Value,"github",translate("Github Url"))
o.default=github_url

luci.sys.call ( "/usr/share/autoupdate/Check_Update.sh > /dev/null")
local cloud_version = luci.sys.exec("cat /tmp/Cloud_Version")
local local_version = luci.sys.exec("bash /bin/AutoUpdate.sh --var CURRENT_Version")
local local_script_version = luci.sys.exec("bash /bin/AutoUpdate.sh -V local")
local cloud_script_version = luci.sys.exec("bash /bin/AutoUpdate.sh -V cloud")
local firmware_type = luci.sys.exec("bash /bin/AutoUpdate.sh --var Firmware_Type")

button_upgrade_firmware = s:option (Button, "_button_upgrade_firmware", translate("Upgrade to Latested Version"),
translatef("Please wait patiently after clicking Do Upgrade button") .. "<br><br>当前固件版本: " .. local_version .. "<br>云端固件版本: " .. cloud_version.. "<br>固件格式: " .. firmware_type)
button_upgrade_firmware.inputtitle = translate ("Do Upgrade")
button_upgrade_firmware.write = function()
	luci.sys.call ("bash /bin/AutoUpdate.sh -u > /dev/null")
end

button_upgrade_firmware_proxy = s:option (Button, "_button_upgrade_firmware_proxy", translate("Upgrade to Latested Version"),translate("Upgrade with [FastGit] Proxy"))
button_upgrade_firmware_proxy.inputtitle = translate ("Do Upgrade")
button_upgrade_firmware_proxy.write = function()
	luci.sys.call ("bash /bin/AutoUpdate.sh -u -P > /dev/null")
end

button_upgrade_script = s:option (Button, "_button_upgrade_script", translate("Upgrade Script"),
translatef("This may solve some compatibility issues") .. "<br><br>当前脚本版本: " .. local_script_version .. "<br>云端脚本版本: " .. cloud_script_version)
button_upgrade_script.inputtitle = translate ("Do Upgrade")
button_upgrade_script.write = function()
	luci.sys.call ("bash /bin/AutoUpdate.sh -x -P > /dev/null")
end

local e=luci.http.formvalue("cbi.apply")
if e then
  io.popen("/etc/init.d/autoupdate restart")
end

m.reset  = false
return m