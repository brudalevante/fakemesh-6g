module("luci.controller.dwan2", package.seeall)

function index()
    entry({"admin", "network", "dwan2"}, view("dwan2/dwan2"), _("DWAN2"), 91)
end