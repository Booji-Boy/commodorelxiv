import hljs from 'highlight.js/lib/core';

<<<<<<< HEAD
import { useLocalState } from '../../backend';
import { Box, Button, Modal, Section } from '../../components';
import { sanitizeText } from '../../sanitize';

=======
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
export const ChunkViewModal = (props) => {
  const [, setModal] = useLocalState('modal');
  const [viewedChunk, setViewedChunk] = useLocalState('viewedChunk');
  return (
    <Modal
      height={`${window.innerHeight * 0.8}px`}
      width={`${window.innerWidth * 0.5}px`}
    >
      <Section
        fill
        scrollable
        scrollableHorizontal
        title="Chunk"
        buttons={
          <Button
            color="red"
            icon="window-close"
            onClick={() => {
              setModal(null);
              setViewedChunk(null);
            }}
          >
            Close
          </Button>
        }
      >
        <Box
          as="pre"
          dangerouslySetInnerHTML={{
            __html: hljs.highlight(sanitizeText(viewedChunk), {
              language: 'lua',
            }).value,
          }}
        />
      </Section>
    </Modal>
  );
};
