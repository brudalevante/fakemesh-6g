module("luci.controller.usteer2", package.seeall)

function index()
    entry({"admin", "mesh", "usteer2"}, view("usteer2/usteer2"), _("Usteer2"), 90)
end