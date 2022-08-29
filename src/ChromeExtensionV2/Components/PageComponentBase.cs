using Microsoft.AspNetCore.Components;
using Microsoft.JSInterop;

namespace ChromeExtensionV2.Components
{
    public abstract class PageComponentBase : ComponentBase
    {
        /// <summary>
        /// Gets or sets the <see cref="IJSRuntime"/> instance.
        /// </summary>
        [Inject]
        protected IJSRuntime JS { get; set; }

        /// <summary>
        /// Gets the <see cref="IJSObjectReference"/> instance.
        /// </summary>
        protected IJSObjectReference Module { get; private set; }

        /// <inheritdoc />
        protected override async Task OnAfterRenderAsync(bool firstRender)
        {
            if (!firstRender)
            {
                return;
            }

            this.Module = await this.JS.InvokeAsync<IJSObjectReference>("import", "./js/main.js");

            var src = "js/dist/browser-polyfill.min.js";
            await this.Module.InvokeVoidAsync("loadJs", src);
            await this.LoadAdditionalJsAsync();
        }

        /// <summary>
        /// Loads additional JavaScript resources.
        /// </summary>
        protected abstract Task LoadAdditionalJsAsync();
    }
}