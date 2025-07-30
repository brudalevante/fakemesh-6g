module("luci.controller.dawn2", package.seeall)

function index()
    entry({"admin", "mesh", "dawn2"}, view("dawn2/dawn"), _("DAWN2"), 91)
end
