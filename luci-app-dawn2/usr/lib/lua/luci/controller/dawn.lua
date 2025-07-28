module("luci.controller.dawn", package.seeall)

function index()
    entry({"admin", "mesh", "dawn2"}, view("dawn2/dawn2"), _("DAWN2"), 91)
end
