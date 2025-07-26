module("luci.controller.dawn2", package.seeall)

function index()
    entry({"admin", "network", "dawn2"}, view("dawn2/dawn2"), _("DAWN2"), 91)
end
