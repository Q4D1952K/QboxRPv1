import { useNuiEvent } from '../../hooks/useNuiEvent';
import { toast, Toaster } from 'react-hot-toast';
import ReactMarkdown from 'react-markdown';
import { Box, Center, createStyles, Group, keyframes, RingProgress, Stack, Text, ThemeIcon } from '@mantine/core';
import React, { useState } from 'react';
import tinycolor from 'tinycolor2';
import type { NotificationProps } from '../../typings';
import MarkdownComponents from '../../config/MarkdownComponents';
import LibIcon from '../../components/LibIcon';

const useStyles = createStyles((theme) => ({
  container: {
    maxWidth: 450,
    minWidth: 300,
    backgroundColor: 'rgba(30, 30, 30, 0.95)',
    height: 'fit-content',
    color: theme.white,
    borderRadius: `${theme.radius.md}px ${theme.radius.sm}px ${theme.radius.sm}px ${theme.radius.md}px`,
    position: 'relative',
    display: 'flex',
    justifyItems: 'center',
    alignItems: 'baseline',
    boxShadow: theme.shadows.sm,
  },
  title: {
    fontWeight: 500,
    color: theme.white,
    lineHeight: 'normal',
  },
  description: {
    fontSize: 14,
    color: theme.white,
    lineHeight: 'normal',
  },
  descriptionOnly: {
    fontSize: 14,
    color: theme.white,
    lineHeight: 'normal',
  },
}));

const createAnimation = (from: string, to: string, visible: boolean) => keyframes({
  from: {
    opacity: visible ? 0 : 1,
    transform: `translate${from}`,
  },
  to: {
    opacity: visible ? 1 : 0,
    transform: `translate${to}`,
  },
});

const getAnimation = (visible: boolean, position: string) => {
  const animationOptions = visible ? '0.2s ease-out forwards' : '0.4s ease-in forwards'
  let animation: { from: string; to: string };

  if (visible) {
    animation = position.includes('bottom') ? { from: 'Y(30px)', to: 'Y(0px)' } : { from: 'Y(-30px)', to:'Y(0px)' };
  } else {
    if (position.includes('right')) {
      animation = { from: 'X(0px)', to: 'X(100%)' }
    } else if (position.includes('left')) {
      animation = { from: 'X(0px)', to: 'X(-100%)' };
    } else if (position === 'top-center') {
      animation = { from: 'Y(0px)', to: 'Y(-100%)' };
    } else if (position === 'bottom') {
      animation = { from: 'Y(0px)', to: 'Y(100%)' };
    } else {
      animation = { from: 'X(0px)', to: 'X(100%)' };
    }
  }

  return `${createAnimation(animation.from, animation.to, visible)} ${animationOptions}`
};

const durationCircle = keyframes({
  '0%': { strokeDasharray: `0, ${6.95 * 2 * Math.PI}` },
  '100%': { strokeDasharray: `${6.95 * 2 * Math.PI}, 0` },
});

const Notifications: React.FC = () => {
  const { classes } = useStyles();
  const [toastKey, setToastKey] = useState(0);

  useNuiEvent<NotificationProps>('notify', (data) => {
    if (!data.title && !data.description) return;

    const toastId = data.id?.toString();
    const duration = data.duration || 3000;

    let iconColor: string;
    let position = data.position || 'bottom-center';

    data.showDuration = data.showDuration !== undefined ? data.showDuration : true;

    if (toastId) setToastKey(prevKey => prevKey + 1);

    // Backwards compat with old notifications
    switch (position) {
      case 'top':
        position = 'top-center';
        break;
      case 'bottom':
        position = 'bottom-center';
        break;
    }

    if (!data.icon) {
      switch (data.type) {
        case 'error':
          data.icon = 'circle-xmark';
          break;
        case 'success':
          data.icon = 'circle-check';
          break;
        case 'warning':
          data.icon = 'circle-exclamation';
          break;
        default:
          data.icon = 'circle-info';
          break;
      }
    }

    if (!data.iconColor) {
      switch (data.type) {
        case 'error':
          iconColor = '#FA5252';
          break;
        case 'success':
          iconColor = '#40C057';
          break;
        case 'warning':
          iconColor = '#FAB005';
          break;
        default:
          iconColor = '#228BE6';
          break;
      }
    } else {
      iconColor = tinycolor(data.iconColor).toRgbString();
    }
    
    toast.custom(
      (t) => (
        <Box
          sx={{
            animation: getAnimation(t.visible, position),
            ...data.style,
          }}
          className={`${classes.container}`}
        >
          <Group noWrap position="apart" align="center" spacing={12}>
            {data.icon && (
              <>
               <ThemeIcon
                color={iconColor}
                radius="xl"
                size={38}
                variant="default" // Hoặc loại bỏ dòng này để không có viền
                style={{
                  border: 'none', // Loại bỏ viền
                  marginLeft: 6, // Khoảng cách từ bên trái của Box
                  backgroundColor: 'rgba(30, 30, 30, 0.95)',
                }}
              >
                <LibIcon icon={data.icon} fixedWidth color={iconColor} animation={data.iconAnimation} />
              </ThemeIcon>
                
                <Stack spacing={0} style={{ flexGrow: 1 }}>
                  {/* {data.title && <Text className={classes.title}>{data.title}</Text>} */}
                  {data.description && (
                    <ReactMarkdown
                      components={MarkdownComponents}
                      className={`${!data.title ? classes.descriptionOnly : classes.description} description`}
                    >
                      {data.description}
                    </ReactMarkdown>
                  )}
                </Stack>
    
                {data.showDuration && (
                  <RingProgress
                    key={toastKey}
                    size={24}
                    thickness={4}
                    roundCaps
                    sections={[{ value: 100, color: iconColor }]}
                    styles={{
                      root: {
                        position: 'absolute',
                        right: 4, // Khoảng cách từ bên phải của Box
                        top: '50%',
                        transform: 'translateY(-50%)',
                        '> svg > circle:nth-of-type(2)': {
                          opacity: '0.8',
                          animation: `${durationCircle} linear reverse forwards`,
                          animationDuration: `${duration}ms`,
                          strokeLinecap: 'round', // Làm tròn các đầu đường tròn
                        },
                        margin: `0 ${12}px 0 ${12}px`, // Khoảng cách từ các cạnh của vòng tròn
                      },
                    }}
                  />
                
                )}
              </>
            )}
          </Group>
        </Box>
      ),
      {
        id: toastId,
        duration: duration,
        position: position,
      }
    );    
  });

  return <Toaster />;
};

export default Notifications;
