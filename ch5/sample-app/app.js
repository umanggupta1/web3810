app.get('/', (req, res) => {
if (lookupFeatureToggle(req, "HOME_PAGE_FLAVOR") === "v2") {
res.send(newFancyHomepage());
} else {
res.send('Fundamentals Of DevOps!');
}
});
