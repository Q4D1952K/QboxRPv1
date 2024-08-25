import React, {useRef} from 'react';
import { useNuiEvent } from '../../hooks/useNuiEvent';
import { Box, createStyles, Group, Paper, Flex, Text, Button, Divider } from '@mantine/core';
import { FontAwesomeIcon } from '@fortawesome/react-fontawesome';
import ReactMarkdown from 'react-markdown';
import ScaleFade from '../../transitions/ScaleFade';
import type { TextUiPosition, TextUiProps } from '../../typings';
import MarkdownComponents from '../../config/MarkdownComponents';

const useStyles = createStyles((theme, params: { position?: TextUiPosition }) => ({
  wrapper: {
    height: '100%',
    width: '100%',
    position: 'absolute',
    display: 'flex',
    alignItems: 
      params.position === 'top-center' ? 'baseline' :
      params.position === 'bottom-center' ? 'flex-end' : 'center',
    justifyContent: 
      params.position === 'right-center' ? 'flex-end' :
      params.position === 'left-center' ? 'flex-start' : 'center',
  },
  container: {
    fontSize: 16,
    padding: 12,
    margin: 8,
    backgroundColor: theme.colors.dark[6],
    color: theme.colors.dark[0],
    // borderRadius: theme.radius.sm,
    // boxShadow: theme.shadows.sm,
  },
  actionTitle: {
    // backgroundColor: theme.colors[theme.primaryColor][theme.fn.primaryShade()],
    borderRight: '2px solid #ccc',
    borderBottom: '3px solid #ccc',
    color: 'black',
    boxSizing: 'border-box',
    boxShadow: '0 2px 3px rgba(0,0,0,0.1)',
    textTransform: 'uppercase',
    fontFamily: 'monospace',
  },
  buttonPressed: {
    transform: 'translateY(1px)',
    transition: 'transform 0.1 ease',
  },

  divider: {
    // borderColor: 'red',

    borderColor: theme.colors[theme.primaryColor][theme.fn.primaryShade()],
    fontWeight: 'bold',
    width: '6px',
  },
}));

const TextUI: React.FC = () => {
  const [data, setData] = React.useState<TextUiProps>({
    text: '',
    position: 'right-center',
  });
  const [visible, setVisible] = React.useState(false);
  const { classes } = useStyles({ position: data.position });
  const [isSimpleText, setIsSimpleText] = React.useState(false);
  const [keyDescriptionPairs, setKeyDescriptionPairs] = React.useState<{ key: string; description: string }[]>([]);
  const [activeButtonIndex, setActiveButtonIndex] = React.useState<number | null>(null);
  const buttonRefs = useRef<HTMLButtonElement[]>([]);

  React.useEffect(() => {
    const handleKeyDown = (e: KeyboardEvent) => {
      keyDescriptionPairs.forEach((pair, index) => {
        if (e.key.toLowerCase() === pair.key.toLowerCase()) {
          buttonRefs.current[index]?.click();
          setActiveButtonIndex(index);
          setTimeout(() => {
            setActiveButtonIndex(null);
          }, 100);
        }
      });
    };

    window.addEventListener('keydown', handleKeyDown);

    return () => {
      window.removeEventListener('keydown', handleKeyDown);
    };
  }, [keyDescriptionPairs]);

  React.useEffect(() => {
    const regex = /\[(.*?)\] - (.*?)(?= \n|$)/g;
    const matches = [...data.text.matchAll(regex)];

    if (matches.length) {
      const keyDescriptionPairs = matches.map((match) => ({ key: match[1], description: match[2] }));
      setKeyDescriptionPairs(keyDescriptionPairs);
      setIsSimpleText(false);
    } else {
      setIsSimpleText(true);
    }
  }, [data.text]);
  useNuiEvent<TextUiProps>('textUi', (data) => {
    if (!data.position) data.position = 'right-center'; // Default right position
    setData(data);
    setVisible(true);
  });

  useNuiEvent('textUiHide', () => setVisible(false));

  return (
    <>
      <Box className={classes.wrapper}>
        <ScaleFade visible={visible}>
        <Paper shadow="md" style={data.style} className={classes.container}>
            <Group spacing={'md'}>
              {data.icon && <FontAwesomeIcon icon={data.icon} fixedWidth size="lg" style={{ color: data.iconColor }} />}
              {isSimpleText ? (
                <Text>{data.text}</Text>
              ) : (
                <Flex direction={'column'} gap={'sm'}>
                  {keyDescriptionPairs.map((pair, index) => (
                    <Flex direction={'row'} gap={'xs'} align={'center'} key={index}>
                      <Button
                        size={'xs'}
                        variant={'white'}
                        c={'text.primary'}
                        compact
                        ref={(el: any) => (buttonRefs.current[index] = el)}
                        onKeyDown={(e) => {}}
                        className={`${classes.actionTitle} ${index === activeButtonIndex ? classes.buttonPressed : ''}`}
                      >
                        {pair.key}
                      </Button>
                      <Divider orientation="horizontal" variant="solid" size={'sm'} className={`${classes.divider} `} />
                      <ReactMarkdown components={MarkdownComponents}>{pair.description}</ReactMarkdown>
                    </Flex>
                  ))}
                </Flex>
              )}
            </Group>
          </Paper>
        </ScaleFade>
      </Box>
    </>
  );
};

export default TextUI;
