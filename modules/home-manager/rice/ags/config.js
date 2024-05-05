
const Bar = (/** @type {number} */ monitor) => Widget.Window({
    monitor,
    name: `bar${monitor}`,
    anchor: [ 'left' ],
    exclusivity: 'exclusive',
    child: Widget.CenterBox({
        start_widget: Widget.Label({
            vpack: 'start',
            label: 'AGS!',
        }),
    }),
})

App.config({
    windows: [Bar(0)],
})
