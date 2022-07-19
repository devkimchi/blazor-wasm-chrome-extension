using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;

namespace ChromeExtensionV2.Components
{
    public class PageComponentBase : ComponentBase
    {
        [Inject]
        protected IJSRuntime JS { get; set; }

        protected IJSObjectReference Module { get; private set; }

        protected override async Task OnAfterRenderAsync(bool firstRender)
        {
            this.Module = await JS.InvokeAsync<IJSObjectReference>("import", "./js/main.js").ConfigureAwait(false);

            var src = "js/dist/browser-polyfill.min.js";
            await this.Module.InvokeVoidAsync("loadJs", src).ConfigureAwait(false);
        }
    }
}