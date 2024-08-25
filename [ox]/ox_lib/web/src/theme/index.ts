import { MantineThemeOverride } from '@mantine/core';

export const theme: MantineThemeOverride = {
  colorScheme: 'dark',
  fontFamily: 'Montserrat, -apple-system, BlinkMacSystemFont, Segoe UI, Roboto, Helvetica, Arial, sans-serif',
  shadows: { sm: '1px 1px 3px rgba(0, 0, 0, 0.5)' },
  colors: {
    dark: [
      '#e2e2e2', // dark 0, titles, bold texts - using Tailwind 50, very light gray for high contrast with dark backgrounds
      '#d4d4d4', // dark 1, not important - using Tailwind 300, a muted mid-light gray for elements that shouldn't draw much attention
      '#a3a3a3', // dark 2, dimmed text - using Tailwind 400, a mid-gray for readable yet not dominant text
      '#737373', // dark 3, disabled texts - using Tailwind 500, a darker gray to indicate inactive or disabled texts
      '#2e2e2e', // dark 4, disabled backgrounds - using Tailwind 600, to provide a significantly darker background for disabled elements
      '#191919', // dark 5, hover backgrounds - using Tailwind 700, a dark gray to give feedback on hover actions
      '#161616', // dark 6, main backgrounds - using Tailwind 950, a very dark gray, almost black, for main backgrounds
      '#1e1e1e', // dark 7, dialogs, paper components - using Tailwind 900, a dark gray for a cohesive and modern dialog and paper component backgrounds
      '#262626', // dark 8, darker backgrounds - using Tailwind 800, to differentiate layers in the UI effectively
      '#0a0a0a', // dark 9, the background colors behind modals - repeating Tailwind 950, to create a deep background behind modals and pop-ups
    ],
  },
  components: {
    Button: {
      styles: {
        root: {
          border: 'none',
        },
      },
    },

    Paper: {
      styles: {
        root: {},
      },
    },
  },
};
