import { marked } from 'marked';
<<<<<<< HEAD

=======
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
import { useBackend } from '../backend';
import { Window } from '../layouts';
import { sanitizeText } from '../sanitize';

type MarkdownViewerData = {
  title: string;
  content: string;
  author: string;
};

export const MarkdownViewer = (_: any) => {
  const { data } = useBackend<MarkdownViewerData>();
  return (
<<<<<<< HEAD
    <Window theme="paper" title={data.title} width={300} height={300}>
=======
    <Window theme="paper" title={data.title}>
>>>>>>> d5bf95a382412b82273dae5d98e31f790db351f9
      <Window.Content scrollable backgroundColor={'#FFFFFF'}>
        <MarkdownRenderer content={data.content} />
      </Window.Content>
    </Window>
  );
};

type MarkdownRendererProps = {
  content: string;
  sanitize?: boolean;
};

export const MarkdownRenderer = (props: MarkdownRendererProps) => {
  let { content, sanitize } = props;

  content = marked(content);
  if (sanitize) {
    content = sanitizeText(content, /* advHtml = */ false);
  }

  // eslint-disable-next-line react/no-danger
  return <div dangerouslySetInnerHTML={{ __html: content }} />;
};

MarkdownRenderer.defaultProps = {
  sanitize: true,
};
