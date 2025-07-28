module("luci.controller.dawn", package.seeall)

function index()
    entry({"admin", "mesh", "dawn2"}, view("dawn/dawn"), _("DAWN2"), 91)
end